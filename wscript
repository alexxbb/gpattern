import os
from waf_common import setup_houdini

HHOME = r'C:/Users/alex/Documents/houdini16.0'
DSO_HOME = os.path.join(HHOME, 'DSO')


def configure(conf):
    conf.setup_houdini()


def build(ctx):
    ctx.shlib(source="sop_gpattern.cpp",
              target='sop_gpattern',
              includes=['.', ctx.env.HFS_INC],
              defines=ctx.env.DEFINES,
              )
    ctx.install_files(DSO_HOME, ['sop_gpattern.dll'])
