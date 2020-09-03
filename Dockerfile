on: [push,pull_request]
jobs:
  test:
    runs-on: ubuntu-latest
    name: test out our github action with no image version
    steps:
    - name: git checkout
      uses: actions/checkout@v2
    - name: test 
      id: test
      uses: ryanjfrizzell/action-bpd@master
      with:
        docker_registry_url: 'docker.pkg.github.com'
        docker_registry_owner: 'ryanjfrizzell'
        docker_repository: 'action-bpd'
        docker_image: 'bpdautolatest'
        docker_username: ${{ secrets.docker_username }}
        docker_password: ${{ secrets.docker_password }}
        dockerfile: 'test/Dockerfile.test'
    - name: Get the output
      run: |
          echo "imageinfo was ${{ steps.test.outputs.imageinfo }}"
