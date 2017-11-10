### python-postgres 

This is a docker Ubuntu 16 baseimage with python built from source with all build optimizations. The version of Python depends on the tag you choose; 3.4, 3.5, and 3.6 are supported.
In this image, the Python of your choosing is aliased to `python`, `python3`, and `python3.x` (i.e. `python3.6`), so any of these commands can be used for execution. The same goes for `pip`; `pip`, `pip3`, and `pip3.x` will all install packages for the chosen Python. 

It also includes the postgres 10 client & the postgres development headers you need to install `psycopg2`.

To use this image, run `pip freeze > requirements.txt` in your local python env, and then when writing your Dockerfile, use:

```
FROM tomplex/python-postgres:3.6

COPY requirements.txt /project_name/requirements.txt

RUN pip install -r project_name/requirements.txt

ENTRYPOINT [ "python", "my_script.py" ]
```

This will install all of your dependencies to the environment. 

This image's Python includes the optimizations that are added when the `--enable-optimizations` and `--with-lto` flags are used in configuring a Python build.
