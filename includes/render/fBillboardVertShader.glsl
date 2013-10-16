attribute vec3 aVertexPosition;
attribute vec4 aVertexColor;
attribute vec2 aQuadDim;

attribute vec2 aVertexTexCoord;

varying vec4 vVertexColor;
varying vec2 vVertexTexCoord;

uniform mat4 uModelViewMatrix;
uniform mat4 uProjectionMatrix;

void main(void)
{
    vVertexTexCoord = aVertexTexCoord;
    vVertexColor    = aVertexColor;

    vec3 vecDim = vec3(aVertexPosition.x * 2,
                       aVertexPosition.y,
                       aVertexPosition.z * 1);

    vec3 vecRight = vec3(uModelViewMatrix[0].x,
                         uModelViewMatrix[1].x,
                         uModelViewMatrix[2].x);

    vec3 vecUp    = vec3(uModelViewMatrix[0].y,
                         uModelViewMatrix[1].y,
                         uModelViewMatrix[2].y);



    vec3 vecCor = vec3((vecRight.x * vecDim.x + vecUp.x * vecDim.z),
                        vecRight.y * vecDim.x + vecUp.y * vecDim.z,
                       (vecRight.z * vecDim.x + vecUp.z * vecDim.z));

    gl_Position = uProjectionMatrix * uModelViewMatrix * vec4(vecCor,1.0);
}