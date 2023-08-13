#list all pods logs with their name in kubernetes
kubectl get pods -n default|grep -v NAME|awk '{print $1}'|while read pods;do echo "Pod name is $pods" ;kubectl logs $pods;echo;done

#how to run multiple commands in kubernetes pods  from outside at once.
kubectl exec -it  nginx-deployment-7f456874f4-5h4x4  -- bash -c "ls;pwd;echo hello;uname -r;cat /etc/*se"

#run any command in all kubernetes pods 
kubectl get pods|grep -i nginx|while read l;do kubectl exec  $l -- bash -c "service nginx status" ;done

#To list all the downloaded and working images in Kubernetes pods
kubectl get pods --all-namespaces -o=jsonpath="{.items[*].spec.containers[*].image}" | tr -s '[[:space:]]' '\n' | sort -u

#to list all downloaded and working images in kubernetes pods with their image size
kubectl get pods --all-namespaces -o=jsonpath="{.items[*].spec.containers[*].image}" | tr -s '[[:space:]]' '\n' | sort -u | while read -r image; do size=$(docker images --format '{{.Repository}}:{{.Tag}} {{.Size}}' | grep "$image" | awk '{print $2}'); size_in_mb=$(echo "$size" | awk '{gsub(/[A-Za-z]/, "", $0); print $0 / 1024 / 1024}'); echo "$image ($size_in_mb MB)"; done


