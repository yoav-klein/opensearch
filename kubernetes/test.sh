kubectl run --image=ubuntu:22.04 test -- bash -c "while true; do echo '{"animal":"lion"}'; sleep 2; done"
