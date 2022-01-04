# ngs-aws-lambda

Next Generation Shell - custom runtime layer for AWS Lambda.

Consider this project experimental / alpha quality.

See https://github.com/ngs-lang/ngs/issues/88


## Creating a Layer

Requirements:

* docker on local machine
* Functional AWS CLI - the script will publish the layer using AWS CLI
* https://github.com/ngs-lang/ngs checked out to a local directory

```
./make-layer.ngs /path/to/sources/of/ngs
```

Take a note of `LayerVersionArn`.

If the build was OK but the publishing of the layer failed and you would like to retry the publishing after fixing the issue, run the following:

```
./make-layer.ngs /path/to/sources/of/ngs --no-build
```


## Using the Layer

The created layer provides custom runtime. See the official documentation about using custom runtimes:

https://docs.aws.amazon.com/lambda/latest/dg/runtimes-custom.html#runtimes-custom-use

Use `LayerVersionArn` from the output of `make-layer.ngs` to configure your Lambda Function.

See also the `examples` directory.

## Debugging

To debug the `bootstrap` program, pass environment variable `DEBUG=aws_lambda_bootstrap` to the Lambda Function.

## Event

## Context

Sample context (from a log):

```
{function_name=ngs-test-01, initialization_type=on-demand, log_stream_name=2022/01/04/[$LATEST]bfdd8e2d86ec44779cf284118be63e89, runtime_api=127.0.0.1:9001, log_group_name=/aws/lambda/ngs-test-01, function_version=$LATEST, function_memory_size=128, deadline_ms=1641291314318, aws_request_id=5edeb030-f279-49ae-a49c-2b54eafe7dcb, invoked_function_arn=arn:aws:lambda:eu-central-1:123456789:function:ngs-test-01, identity={}, client_context={}}

```