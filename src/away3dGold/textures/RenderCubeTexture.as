﻿package away3dGold.textures
{
	import away3dGold.arcane;
	import away3dGold.materials.utils.MipmapGenerator;
	import away3dGold.tools.utils.TextureUtils;

	import flash.display.BitmapData;
	import flash.display3D.Context3D;
	import flash.display3D.Context3DTextureFormat;
	import flash.display3D.textures.TextureBase;

	use namespace arcane;

	public class RenderCubeTexture extends CubeTextureBase
	{
		public function RenderCubeTexture(size : Number)
		{
			super();
			setSize(size, size);
		}

		public function set size(value : int) : void
		{
			if (value == _width) return;

			if (!TextureUtils.isDimensionValid(value))
				throw new Error("Invalid size: Width and height must be power of 2 and cannot exceed 2048");

			invalidateContent();
			setSize(value, value);
		}

		override protected function uploadContent(texture : TextureBase) : void
		{
			// fake data, to complete texture for sampling
			var bmd : BitmapData = new BitmapData(_width, _height, false, 0);
			for (var i : int = 0; i < 6; ++i)
				MipmapGenerator.generateMipMaps(bmd, texture, null, false, i);
			bmd.dispose();
		}

		override protected function createTexture(context : Context3D) : TextureBase
		{
			return context.createCubeTexture(_width, Context3DTextureFormat.BGRA, true);
		}
	}
}
