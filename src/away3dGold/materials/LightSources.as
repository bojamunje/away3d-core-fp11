package away3dGold.materials
{
	/**
	 * Enumeration class for defining which lighting types affects the specific material
	 * lighting component (diffuse and specular). This can be useful if, for example, you 
	 * want to use light probes for diffuse global lighting, but want specular lights from 
	 * traditional light sources without those affecting the diffuse light. 
	 * 
	 * @see away3dGold.materials.ColorMaterial.diffuseLightSources
	 * @see away3dGold.materials.ColorMaterial.specularLightSources
	 * @see away3dGold.materials.TextureMaterial.diffuseLightSources
	 * @see away3dGold.materials.TextureMaterial.specularLightSources
	*/
	public class LightSources
	{
		/**
		 * Defines normal lights are to be used as the source for the lighting
		 * component.
		*/
		public static const LIGHTS : uint = 0x01;

		/**
		 * Defines that global lighting probes are to be used as the source for the 
		 * lighting component.
		*/
		public static const PROBES : uint = 0x02;

		/**
		 * Defines that both normal and global lighting probes  are to be used as the 
		 * source for the lighting component.
		*/
		public static const ALL : uint = 0x03;
	}
}
