# Add Simple Greeter Function

Having successfully deployed [Apache OpenWhisk](https://openwhisk.apache.org/) to [OpenShift](https://openshift.com), and [OpenWhisk CLI](https://github.com/apache/incubator-openwhisk-cli/releases/) now configured to work with the OpenWhisk, we will now write a simple JavaScript function to verify and validate our deployed environment.


**1. Create a simple greeter JavaScript function**

First, we need to create JavaScript file.  Let's create a directory for our new project:

``mkdir -p /root/projects/getting-started``{{execute}}

Click on the link below to create an empty file called **greeter.js** in the directory **/root/projects/getting-started** : ``greeter.js``{{open}}

Once the created file is opened in the editor, you can then copy the content below into the file (or use the `Copy to editor` button):

<pre class="file" data-filename="/root/projects/getting-started/greeter.js" data-target="replace">
function main() {
    return {payload: 'Welcome to Apache OpenWhisk on OpenShift'};
}
</pre>
Take a minute and review the `greeter.js`. At this stage it is pretty simple and has only one method that returns a JSON payload: 

```json
{"payload": "Welcome to Apache OpenWhisk on OpenShift"}
```

**2. Deploy the function**

Let's now deploy the function called **greeter** to OpenWhisk:

``cd /root/projects/getting-started/``{{execute}}

``wsk -i action create greeter greeter.js``{{execute}}

Let's check if the function is created correctly:

``wsk -i action list | grep greeter``{{execute}}

The output of the command should show somthing like:

```sh
/whisk.system/greeter                                  private nodejs:6
```

**3. Verify the function**

Having created the function **greeter**, let's now verify the function by invoking it:

``wsk -i action invoke greeter --result``{{execute}}

Executing the above command should return us a JSON payload:

```json
{"payload": "Welcome to Apache OpenWhisk on OpenShift"}
```
