package away3dGold.stereo.methods
{
	import away3dGold.core.managers.Stage3DProxy;
	import away3dGold.errors.AbstractMethodError;

	public class StereoRenderMethodBase
	{
		protected var _textureSizeInvalid:Boolean = true;
		
		public function StereoRenderMethodBase()
		{
		}
		
		public function activate(stage3DProxy : Stage3DProxy) : void
		{
		}
		
		public function deactivate(stage3DProxy : Stage3DProxy) : void
		{
		}
		
		public function getFragmentCode() : String
		{
			throw new AbstractMethodError('Concrete implementation of StereoRenderMethodBase must be used and extend getFragmentCode().');
		}
		
		public function invalidateTextureSize():void
		{
			_textureSizeInvalid = true;
		}
	}
}
