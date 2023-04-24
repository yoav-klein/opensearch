


## NOTES

For some reason, when running `port-forward.sh` from A Cloud Guru, I couldn't
connect from outside the network.

The workaround for this is to run SSH port forwarding from your Windows machine to 
the Cloud Guru machine.
So run the `port-forward.sh`, and the run 
```
ssh -L <local_port>:localhost:8080 <this_machine's_ip>
```
