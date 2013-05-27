package away3dGold.core.base
{
	import away3dGold.animators.IAnimator;
	import away3dGold.materials.MaterialBase;

	/**
	 * IMaterialOwner provides an interface for objects that can use materials.
	 */
	public interface IMaterialOwner
	{
		/**
		 * The material with which to render the object.
		 */
		function get material() : MaterialBase;
		function set material(value : MaterialBase) : void;

		/**
		 * The animation used by the material to assemble the vertex code.
		 */
		function get animator() : IAnimator;	// in most cases, this will in fact be null
	}
}