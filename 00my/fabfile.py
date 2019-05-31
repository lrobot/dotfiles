from fabric.api import run as apirun
from fabric.api import get as apiget
from fabric.api import put as apiput

def get(*arg):
    apiget(*arg)

def put(*arg):
    apiput(*arg)

def run(*arg):
    apirun(*arg)




