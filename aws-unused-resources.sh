#!/bin/bash
# Loop through all regions
for region in $(aws ec2 describe-regions --output text | awk '{print $NF}'); do
    echo "Checking unused resources in region: $region"

    # Get all EC2 instances
    instances=$(aws ec2 describe-instances --region $region --output text | awk '{print $NF}')

    # Loop through all EC2 instances
    for instance in $instances; do
        # Get the tags for each instance
        tags=$(aws ec2 describe-tags --filters "Name=resource-id,Values=$instance" --region $region --output text)

        # Check if the instance is tagged
        if [ -z "$tags" ]; then
            echo "Unused EC2 instance: $instance"
        fi
    done

    # Get all EBS volumes
    volumes=$(aws ec2 describe-volumes --region $region --output text | awk '{print $NF}')

    # Loop through all EBS volumes
    for volume in $volumes; do
        # Get the attached instance for each volume
        attached_instance=$(aws ec2 describe-volumes --volume-ids $volume --region $region --output text | awk '$1 == "ATTACHMENTS" {print $3}')

        # Check if the volume is unattached
        if [ -z "$attached_instance" ]; then
            echo "Unused EBS volume: $volume"
        fi
    done

    # Get all snapshots
    snapshots=$(aws ec2 describe-snapshots --owner-ids self --region $region --output text | awk '{print $NF}')

    # Loop through all snapshots
    for snapshot in $snapshots; do
        # Get the volume for each snapshot
        volume=$(aws ec2 describe-snapshots --snapshot-ids $snapshot --region $region --output text | awk '$1 == "VOLUMEID" {print $NF}')

        # Check if the volume exists
        volume_exists=$(aws ec2 describe-volumes --volume-ids $volume --region $region)

        # Check if the volume is deleted
        if [ -z "$volume_exists" ]; then
            echo "Unused snapshot: $snapshot"
        fi
    done
done

