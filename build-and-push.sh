checkout_point=tags/${RELEASE_VERSION}

if test $RELEASE_VERSION = "main"; then
  checkout_point=main
fi

# build and push
docker build --build-arg checkout_point=$checkout_point -t zkmrgirish/promtool:${RELEASE_TAG}
docker push zkmrgirish/promtool:${RELEASE_TAG}
