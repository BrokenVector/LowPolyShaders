Shader "LowPolyShaders/LowPolyPBRSpecular"
{
	Properties
	{
		_MainTex ("Albedo", 2D) = "white" {}
		_Color ("Albedo Tint", Color) = (1,1,1,1)
		_Specular ("Specular (RGB: Spec, A: Gloss)", 2D) = "white" {}
		_SpecTint ("Specular Tint", Color) = (0,0,0,0)
	}

	SubShader
	{
		Tags { "RenderType"="Opaque" }
		LOD 200

		CGPROGRAM

		#pragma surface surf StandardSpecular fullforwardshadows vertex:vert
		#pragma target 3.0

		struct Input
		{
			half3 color;
			half4 specular;
		};

		sampler2D _MainTex;
		sampler2D _Specular;
		fixed4 _Color;
		fixed4 _SpecTint;

		void vert (inout appdata_full v, out Input o)
		{
			o.color = tex2Dlod(_MainTex, v.texcoord) * _Color;
			o.specular = tex2Dlod(_Specular, v.texcoord) * _SpecTint;
		}

		void surf (Input IN, inout SurfaceOutputStandardSpecular o)
		{
			o.Albedo = IN.color;
			// specular color
			o.Specular = IN.specular;
			// smoothness from alpha component of specularity texture
			o.Smoothness = IN.specular.a;
		}
		ENDCG
	}
	FallBack "Diffuse"
}
