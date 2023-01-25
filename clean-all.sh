for d in */; do
    rm -rf "./${d%?}/cbin"
    rm -rf "./${d%?}/fbin"
    rm -rf "./${d%?}/gbin"
done
