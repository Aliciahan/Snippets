import sys
import os.path as p
import subprocess
import re

NO_PYTHON_LIBRARY_ERROR = 'ERROR: unable to find an appropriate Python library.'
PY_MAJOR, PY_MINOR = sys.version_info[ 0 : 2 ]
LIBRARY_LDCONFIG_REGEX = re.compile(
'(?P<library>\S+) \(.*\) => (?P<path>\S+)' )

if not ( ( PY_MAJOR == 2 and PY_MINOR >= 6 ) or
            ( PY_MAJOR == 3 and PY_MINOR >= 3 ) or
            PY_MAJOR > 3 ):
    sys.exit( 'ycmd requires Python >= 2.6 or >= 3.3; '
            'your version of Python is ' + sys.version )

def GetPythonNameOnUnix():
    python_name = 'python' + str( PY_MAJOR ) + '.' + str( PY_MINOR )
    # Python 3 has an 'm' suffix on Unix platforms, for instance libpython3.3m.so.
    if PY_MAJOR == 3:
        python_name += 'm'
    return python_name


def GetStandardPythonLocationsOnUnix( prefix, name ):
    return ( '{0}/lib/lib{1}'.format( prefix, name ),
            '{0}/include/{1}'.format( prefix, name ) )


def CheckOutput( *popen_args, **kwargs ):
    process = subprocess.Popen( stdout=subprocess.PIPE, *popen_args, **kwargs )
    output, unused_err = process.communicate()
    retcode = process.poll()
    if retcode:
        command = kwargs.get( 'args' )
        if command is None:
            command = popen_args[ 0 ]
        error = subprocess.CalledProcessError( retcode, command )
        error.output = output
        raise error
    return output


def FindPythonLibrariesOnLinux():
    python_name = GetPythonNameOnUnix()
    python_library_root, python_include = GetStandardPythonLocationsOnUnix(
        sys.exec_prefix, python_name )

    python_library = python_library_root + '.so'
    if p.isfile( python_library ):
        return python_library, python_include

    python_library = python_library_root + '.a'
    if p.isfile( python_library ):
        sys.exit( NO_DYNAMIC_PYTHON_ERROR.format( library = python_library,
                                                flag = '--enable-shared' ) )

    # On some distributions (Ubuntu for instance), the Python system library is
    # not installed in its default path: /usr/lib. We use the ldconfig tool to
    # find it.
    python_library = 'lib' + python_name + '.so'
    ldconfig_output = CheckOutput( [ 'ldconfig', '-p' ] ).strip().decode( 'utf8' )
    for line in ldconfig_output.splitlines():
        match = LIBRARY_LDCONFIG_REGEX.search( line )
        if match and match.group( 'library' ) == python_library:
            return match.group( 'path' ), python_include

    sys.exit( NO_PYTHON_LIBRARY_ERROR )

print "\n".join(FindPythonLibrariesOnLinux());
