# mnd-orchestra

Dockerfile for setup a demo project for UnlimitedLabs/Orchestra.


## Run it

* git clone https://github.com/mondora-labs/mnd-orchestra
* Build image: `docker build -t mondora/mnd-orchestra:1.0.0 .`
* Run: `docker run -d -p 8000:8000 mondora/mnd-orchestra:1.0.0`
* Browse: http://<your_ip>:8000/orchestra/app
* Login with: admin/admin, demo/demo 

## References

Orchestra docs: http://orchestra.readthedocs.org/en/stable/

# License

This project is Apache 2 licensed.

