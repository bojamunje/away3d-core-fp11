package away3dGold.materials
{
	import away3dGold.arcane;

	use namespace arcane;

	/**
	 * ColorMultiPassMaterial is a material that uses a flat colour as the surfaces diffuse.
	 */
	public class ColorMultiPassMaterial extends MultiPassMaterialBase
	{
		/**
		 * Creates a new ColorMultiPassMaterial object.
		 * 
		 * @param color The material's diffuse surface color.
		 */
		public function ColorMultiPassMaterial(color : uint = 0xcccccc)
		{
			super();
			this.color = color;
		}

		/**
		 * The diffuse color of the surface.
		 */
		public function get color() : uint
		{
			return diffuseMethod.diffuseColor;
		}

		public function set color(value : uint) : void
		{
			diffuseMethod.diffuseColor = value;
		}
	}
}