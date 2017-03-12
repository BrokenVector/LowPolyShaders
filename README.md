# Low Poly Shaders
Shaders optimized for Low Poly models.
These are simple shaders which need less draw calls than the default shaders.

## How do they work?
Instead of doing the texture lookup's in the fragment/pixel stage they are doing it in the vertex stage. So the texture lookup is only made once for every vertex instead of once for every pixel on that object (per vertex texture lookup's).

## Contents:
- PBR Shader (like the Unity Standard Shader)
- Unlit Shader
