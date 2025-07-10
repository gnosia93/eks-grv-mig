* npm-check를 이용한 npm 의존성 관리 - https://blog.outsider.ne.kr/1228

* How to find native modules in a node.js dependency tree? 
  - https://stackoverflow.com/questions/36032250/how-to-find-native-modules-in-a-node-js-dependency-tree

## how to check nodo.js addon support arm ? ##

To determine if a Node.js addon supports ARM architecture, you need to check if the addon's compiled binaries are available for ARM or if the addon's source code can be compiled for ARM. You can check the addon's documentation, release notes, or installation instructions for specific ARM support information. Additionally, you can examine the addon's build process, typically using node-gyp, to see if it supports ARM compilation. 
Here's a more detailed breakdown:

1. Check the addon's documentation and release notes:
Many well-maintained Node.js addons provide detailed information about supported architectures in their documentation or release notes. Look for sections related to "Platform Support," "Architecture," or "Binary Distribution."
Examine the release notes for any mentions of ARM support or specific ARM architectures (e.g., ARMv7, ARM64) that are supported.

2. Examine the addon's build process (node-gyp):
Node.js addons are often built using node-gyp, which is a tool that helps compile native code for Node.js.
If you're building the addon from source, check the binding.gyp file (or similar) to see if the build configuration includes ARM architectures. You might see conditional compilation flags or target architectures specified.
The node-gyp tool itself has some dependencies, like Python. Ensure you have a compatible Python version installed and that node-gyp is configured correctly for ARM. 

3. Inspect the addon's published packages:
If the addon is published on npm, you can inspect the package's package.json file and its binary field (if present) to see if prebuilt binaries for ARM are available.
Some addons might publish separate packages for different architectures.

4. Test the addon:
If you can't find explicit information about ARM support, you can try installing and testing the addon on an ARM-based system.
If the installation process fails or the addon doesn't work as expected, it's likely that it doesn't have native ARM support.

5. Consider using N-API:
If you are developing a new addon, consider using N-API (Node-API), which is an ABI-stable interface for building native Node.js addons. N-API makes it easier to create addons that are compatible across different Node.js versions and architectures, including ARM. 
Example:
Let's say you're trying to use the bcrypt addon. You might find in its documentation or release notes that it supports ARM architectures like ARMv7 and ARM64. If not, you could check its binding.gyp file to see if the build process includes these architectures. You could also try installing it on an ARM system to see if it works. If you're developing a new addon, using N-API would simplify the process of supporting ARM. 
By following these steps, you can effectively determine if a Node.js addon supports ARM and ensure it works correctly on your target architecture. 
