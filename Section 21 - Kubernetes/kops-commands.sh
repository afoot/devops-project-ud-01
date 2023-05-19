kops create cluster \
  --name=kubevpro.wandering-mono.top \
  --state=s3://vprofile-kops-state-mono \
  --zones=us-east-1a,us-east-1b \
  --node-count=2 \
  --node-size=t3a.small \
  --master-size=t3a.medium \
  --dns-zone=kubevpro.wandering-mono.top \
  --node-volume-size=8 \
  --master-volume-size=8

# pods not working with that cluster
kops create cluster \
  --name=kubevpro.wandering-mono.top \
  --state=s3://vprofile-kops-state-mono \
  --zones=us-east-1a,us-east-1b \
  --node-count=2 \
  --node-size=t2.micro \
  --master-size=t3a.small \
  --dns-zone=kubevpro.wandering-mono.top \
  --node-volume-size=8 \
  --master-volume-size=8

kops update cluster \
  --name kubevpro.wandering-mono.top \
  --state=s3://vprofile-kops-state-mono \
  --yes \
  --admin

kops validate cluster \
  --name kubevpro.wandering-mono.top \
  --state=s3://vprofile-kops-state-mono \
  --wait 10m
  
kops delete cluster \
  --name=kubevpro.wandering-mono.top \
  --state=s3://vprofile-kops-state-mono \
  --yes