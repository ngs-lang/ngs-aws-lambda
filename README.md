# ngs-aws-lambda

Run NGS in AWS Lambda - custom runtime

Don't use yet, it's a work in progress.

See https://github.com/ngs-lang/ngs/issues/88


## Debugging

To debug the `bootstrap` program, pass environment variable `DEBUG=aws_lambda_bootstrap` to the Lambda.

## Context

Sample context (from a log):

```
{function_name=ngs-test-01, initialization_type=on-demand, log_stream_name=2022/01/04/[$LATEST]bfdd8e2d86ec44779cf284118be63e89, runtime_api=127.0.0.1:9001, log_group_name=/aws/lambda/ngs-test-01, function_version=$LATEST, function_memory_size=128, deadline_ms=1641291314318, aws_request_id=5edeb030-f279-49ae-a49c-2b54eafe7dcb, invoked_function_arn=arn:aws:lambda:eu-central-1:123456789:function:ngs-test-01, identity={}, client_context={}}

```