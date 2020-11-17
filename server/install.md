1. Install Istio
   ```bash
   istioctl install --profile=default
   ```
2. create petclinic namespace 
   ```bash
   kubectl  create namespace petclinic
   kubectl label namespace petclinic istio-injection=enabled
   ```