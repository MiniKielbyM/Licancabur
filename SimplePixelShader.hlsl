struct PixelShaderInput
{
    float3 normal : NORMAL;
    float4 color : COLOR;
};

float4 SimplePixelShader(PixelShaderInput IN) : SV_TARGET
{
    float3 lightDir =
        normalize(float3(-1, -1, -1));

    float diffuse =
        saturate(dot(normalize(IN.normal), -lightDir));

    diffuse = max(diffuse, 0.15);

    return IN.color * diffuse;
}