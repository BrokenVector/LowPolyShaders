Shader "LowPolyShaders/LowPolyUnlitShader" {
	Properties {
		_MainTex ("Color Scheme", 2D) = "white" {}
		_Color ("Tint", Color) = (1,1,1,1)
	}
	SubShader {
		Tags { "RenderType"="Opaque" }
		LOD 200
		
		CGPROGRAM
		#pragma surface surf Unlit vertex:vert noforwardadd

		// Use shader model 3.0 target, to get nicer looking lighting
		#pragma target 3.0

		fixed4 LightingUnlit(SurfaceOutput s, fixed3 lightDir, fixed atten)
		{
			fixed4 c;
			c.rgb = s.Albedo; 
			c.a = s.Alpha;
			return c;
		}

		struct Input {
			float3 color : COLOR;
		};		

		sampler2D _MainTex;
		fixed4 _Color;

		void vert (inout appdata_full v) {
			// the color comes from a texture tinted by color
			v.color = tex2Dlod(_MainTex, v.texcoord) * _Color;
        }

		void surf (Input IN, inout SurfaceOutput o) {
			// Albedo comes from the vertex input
			o.Albedo = IN.color;
		}

		ENDCG
	} 
	FallBack "Unlit/Texture"
}
