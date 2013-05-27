package away3dGold.materials {
	import away3dGold.arcane;
	import away3dGold.materials.passes.SegmentPass;

	use namespace arcane;

	/**
	 * SegmentMaterial is a material exclusively used to render wireframe object
	 *
	 * @see away3dGold.entities.Lines
	 */
	public class SegmentMaterial extends MaterialBase
	{
		private var _screenPass : SegmentPass;

		/**
		 * Creates a new WireframeMaterial object.
		 */
		public function SegmentMaterial(thickness : Number = 1.25){
			super();

			bothSides = true;
			addPass(_screenPass = new SegmentPass(thickness));
			_screenPass.material = this;
		}
	}
}
