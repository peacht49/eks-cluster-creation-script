# eks-cluster-creation-script
simple bash script to spin up an eks cluster on AWS, checks if dependencies like eksctl &amp; kubectl are installed, also configures kubectl after eks cluster is created

## Dependencies
1. eksctl - https://eksctl.io/installation/
2. kubectl - https://console.cloud.google.com/storage/browser/kubernetes-release;tab=objects?pli=1&prefix=&forceOnObjectsSortingFiltering=false 
3. Configure kubectl to access eks cluster once created 

```
Enter your architecture (e.g., amd64 or arm64): amd64
Installing eksctl at /usr/local/bin...
eksctl version: 0.205.0
Installing kubectl at /usr/local/bin...
  % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
                                 Dload  Upload   Total   Spent    Left  Speed
100 53.7M  100 53.7M    0     0  14.4M      0  0:00:03  0:00:03 --:--:-- 14.4M
Client Version: v1.31.0
Kustomize Version: v5.4.2
Enter the following details to create your EKS cluster:
Cluster Name (e.g., my-cluster): testing
Node Instance Type (e.g., t3.medium): t2.micro
Min Nodes (e.g., 1): 1
Max Nodes (e.g., 4): 3
Number of Desired Nodes (e.g., 2): 2
You have entered the following values:
Cluster Name: testing
Region: 
Node Instance Type: t2.micro
Min Nodes: 1
Max Nodes: 3
Desired Nodes: 2
Current region is us-east-1 , do you want to deploy here?

2025-03-18 19:36:35 [ℹ]  eksctl version 0.205.0
2025-03-18 19:36:35 [ℹ]  using region us-east-1
2025-03-18 19:36:36 [ℹ]  setting availability zones to [us-east-1b us-east-1d]
...
2025-03-18 19:36:36 [ℹ]  using Kubernetes version 1.30
2025-03-18 19:36:36 [ℹ]  creating EKS cluster "testing" in "us-east-1" region with 
2025-03-18 19:36:36 [ℹ]  if you encounter any issues, check CloudFormation console or try 'eksctl utils describe-stacks --region=us-east-1 --cluster=testing'
2025-03-18 19:36:36 [ℹ]  Kubernetes API endpoint access will use default of {publicAccess=true, privateAccess=false} for cluster "testing" in "us-east-1"
...
2025-03-18 19:36:36 [ℹ]  if you encounter any issues, check CloudFormation console or try 'eksctl utils describe-stacks --region=us-east-1 --cluster=testing'
2025-03-18 19:36:36 [ℹ]  Kubernetes API endpoint access will use default of {publicAccess=true, privateAccess=false} for cluster "testing" in "us-east-1"
2025-03-18 19:36:36 [ℹ]  CloudWatch logging will not be enabled for cluster "testing" in "us-east-1"
2025-03-18 19:36:36 [ℹ]  you can enable it with 'eksctl utils update-cluster-logging --enable-types={SPECIFY-YOUR-LOG-TYPES-HERE (e.g. all)} --region=us-east-1 --cluster=testing'
2025-03-18 19:36:36 [ℹ]  default addons metrics-server, vpc-cni, kube-proxy, coredns were not specified, will install them as EKS addons
2025-03-18 19:36:36 [ℹ]  
2 sequential tasks: { create cluster control plane "testing", 
    2 sequential sub-tasks: { 
        1 task: { create addons },
        wait for control plane to become ready,
    } 
}
2025-03-18 19:36:36 [ℹ]  building cluster stack "eksctl-testing-cluster"
2025-03-18 19:36:38 [ℹ]  deploying stack "eksctl-testing-cluster"
2025-03-18 19:37:08 [ℹ]  waiting for CloudFormation stack "eksctl-testing-cluster"
2025-03-18 19:37:39 [ℹ]  waiting for CloudFormation stack "eksctl-testing-cluster"
2025-03-18 19:38:40 [ℹ]  waiting for CloudFormation stack "eksctl-testing-cluster"
2025-03-18 19:39:41 [ℹ]  waiting for CloudFormation stack "eksctl-testing-cluster"
2025-03-18 19:40:42 [ℹ]  waiting for CloudFormation stack "eksctl-testing-cluster"
2025-03-18 19:41:43 [ℹ]  waiting for CloudFormation stack "eksctl-testing-cluster"
2025-03-18 19:42:44 [ℹ]  waiting for CloudFormation stack "eksctl-testing-cluster"
2025-03-18 19:43:45 [ℹ]  waiting for CloudFormation stack "eksctl-testing-cluster"
2025-03-18 19:43:49 [ℹ]  creating addon: metrics-server
2025-03-18 19:43:49 [ℹ]  successfully created addon: metrics-server
...
2025-03-18 19:43:51 [ℹ]  creating addon: vpc-cni
2025-03-18 19:43:51 [ℹ]  successfully created addon: vpc-cni
2025-03-18 19:43:52 [ℹ]  creating addon: kube-proxy
2025-03-18 19:43:52 [ℹ]  successfully created addon: kube-proxy
2025-03-18 19:43:53 [ℹ]  creating addon: coredns
2025-03-18 19:43:54 [ℹ]  successfully created addon: coredns
2025-03-18 19:45:57 [ℹ]  waiting for the control plane to become ready
```