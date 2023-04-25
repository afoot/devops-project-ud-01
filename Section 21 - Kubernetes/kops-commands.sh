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

kops update cluster \
  --name kubevpro.wandering-mono.top \
  --state=s3://vprofile-kops-state-mono \
  --yes \
  --admin

kops validate cluster \
  --name kubevpro.wandering-mono.top \
  --state=s3://vprofile-kops-state-mono \
  --wait 3m
  
kops update cluster \
  --name kubevpro.wandering-mono.top \
  --state=s3://vprofile-kops-state-mono \
  --node-count=0 \
  --yes

kops delete cluster \
  --name=kubevpro.wandering-mono.top \
  --state=s3://vprofile-kops-state-mono \
  --yes