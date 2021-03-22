
# Reference: 
# https://cloud.google.com/ai-platform-unified/docs/tutorials/image-recognition-custom/training

###########################################
#
#   Configs
#
###########################################

GCP_PROJECT=zproject201807
GCP_REGION=us-central1
GCP_BUCKET=ai_bucket

# Google Service Account
GOOGLE_APPLICATION_CREDENTIALS='gcp_service_account.json'

###########################################
#
#   Setup
#
###########################################

echo "GCP Project = $GCP_PROJECT"

# Create GCS bucket
gsutil mb -p $GCP_PROJECT -l $GCP_REGION gs://$GCP_BUCKET

# Download Example Code
gsutil cp gs://cloud-samples-data/ai-platform/hello-custom/hello-custom-sample-v1.tar.gz - | tar -xzv

cd hello-custom-sample

###########################################
#
#   Upload Training code to GCS
#
###########################################

# Create a source distribution in the gzipped tarball
python3 setup.py sdist --formats=gztar

# Copy tarball to GCS
gsutil cp dist/hello-custom-training-3.0.tar.gz gs://$GCP_BUCKET/training/

###########################################
#
#   Run Custom Training Pipeline
#
###########################################







#ZEND
