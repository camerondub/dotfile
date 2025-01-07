from invoke import task

@task
def rebuild(c):
    c.run("rm -f dev-requirements.txt")
    c.run("pip-compile dev-requirements.in")
