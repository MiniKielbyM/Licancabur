cbuffer PerApplication : register(b0)
{
    matrix projectionMatrix;
}

cbuffer PerFrame : register(b1)
{
    matrix viewMatrix;
}

cbuffer PerObject : register(b2)
{
    matrix worldMatrix;
}
struct AppData
{
    float3 position : POSITION;
    float3 normal : NORMAL;
    float3 color : COLOR;
};
struct VertexShaderOutput
{
    float4 position : SV_POSITION;
    float3 normal : NORMAL;
    float4 color : COLOR;
};
VertexShaderOutput SimpleVertexShader(AppData IN)
{
    VertexShaderOutput OUT;

    matrix mvp = mul(projectionMatrix,
                 mul(viewMatrix, worldMatrix));

    OUT.position = mul(mvp, float4(IN.position, 1));

    OUT.normal =
        normalize(mul((float3x3) worldMatrix, IN.normal));

    OUT.color = float4(IN.color, 1);

    return OUT;
}