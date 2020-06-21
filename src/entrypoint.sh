#!/bin/bash

COVERAGE_VERSION=""
#!/bin/bash
POSITIONAL=()
while [[ $# -gt 0 ]]
do
key="$1"

case $key in
    --coverage-version)
    COVERAGE_VERSION="$2"
    shift # past argument
    shift # past value
    ;;
    *)    # unknown option
    POSITIONAL+=("$1") # save it in an array for later
    shift # past argument
    ;;
esac
done
set -- "${POSITIONAL[@]}" # restore positional parameters

if [ "$COVERAGE_VERSION" != "" ]; then
    pip install --upgrade coverage==$COVERAGE_VERSION
    if [ "${COVERAGE_VERSION:0:1}" -lt "5" ]; then
        ( set -o posix ; set )
        echo "foo${RUNNER_WORKSPACE}/${RUNNER_WORKSPACE##*/}/bar"
        sed -i "s,$RUNNER_WORKSPACE/${RUNNER_WORKSPACE##*/},$GITHUB_WORKSPACE,g" .coverage
        ls -la
        cat .coverage
    fi
fi
/src/entrypoint.py $@
