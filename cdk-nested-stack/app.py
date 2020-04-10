from aws_cdk import core
import aws_cdk.aws_s3 as s3
import aws_cdk.aws_cloudformation as cfn


class ParentStack(core.Stack):

    def __init__(self, scope: core.Construct, id: str, **kwargs) -> None:
        super().__init__(scope, id, **kwargs)
        
        ChildStack01(self, "ChildStack01")
        ChildStack02(self, "ChildStack020")
        
        
class ChildStack01(cfn.NestedStack):

    def __init__(self, scope: core.Construct, id: str, **kwargs) -> None:
        super().__init__(scope, id, **kwargs)
        
        s3.Bucket(self, "ChildBucket01", bucket_name="child-bucket-01")
        
        
class ChildStack02(cfn.NestedStack):

    def __init__(self, scope: core.Construct, id: str, **kwargs) -> None:
        super().__init__(scope, id, **kwargs)

        s3.Bucket(self, "ChildBucket02", bucket_name="child-bucket-02")


app = core.App()
ParentStack(app, "ParentStack")
app.synth()
