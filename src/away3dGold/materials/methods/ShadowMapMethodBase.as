package away3dGold.materials.methods {
	import away3dGold.*;
	import away3dGold.errors.*;
	import away3dGold.library.assets.*;
	import away3dGold.lights.*;
	import away3dGold.lights.shadowmaps.*;
	import away3dGold.materials.compilation.*;

	use namespace arcane;

	public class ShadowMapMethodBase extends ShadingMethodBase implements IAsset
	{
		protected var _castingLight : LightBase;
		protected var _shadowMapper : ShadowMapperBase;

		protected var _epsilon : Number = .002;
		protected var _alpha : Number = 1;


		public function ShadowMapMethodBase(castingLight : LightBase)
		{
			super();
			_castingLight = castingLight;
			castingLight.castsShadows = true;
			_shadowMapper = castingLight.shadowMapper;
		}
		
		public function get assetType() : String
		{
			return AssetType.SHADOW_MAP_METHOD;
		}
		
		public function get alpha() : Number
		{
			return _alpha;
		}

		public function set alpha(value : Number) : void
		{
			_alpha = value;
		}

		public function get castingLight() : LightBase
		{
			return _castingLight;
		}

		public function get epsilon() : Number
		{
			return _epsilon;
		}

		public function set epsilon(value : Number) : void
		{
			_epsilon = value;
		}
		
		arcane function getFragmentCode(vo : MethodVO, regCache : ShaderRegisterCache, targetReg : ShaderRegisterElement) : String
		{
			throw new AbstractMethodError();
			return null;
		}
	}
}
