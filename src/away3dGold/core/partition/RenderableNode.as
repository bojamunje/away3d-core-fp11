package away3dGold.core.partition
{
	import away3dGold.core.base.IRenderable;
	import away3dGold.core.traverse.PartitionTraverser;
	import away3dGold.entities.Entity;

	/**
	 * RenderableNode is a space partitioning leaf node that contains any Entity that is itself a IRenderable
	 * object. This excludes Mesh (since the renderable objects are its SubMesh children).
	 */
	public class RenderableNode extends EntityNode
	{
		private var _renderable : IRenderable;

		/**
		 * Creates a new RenderableNode object.
		 * @param mesh The mesh to be contained in the node.
		 */
		public function RenderableNode(renderable : IRenderable)
		{
			super(Entity(renderable));
			_renderable = renderable;	// also keep a stronger typed reference
		}

		/**
		 * @inheritDoc
		 */
		override public function acceptTraverser(traverser : PartitionTraverser) : void
		{
			if (traverser.enterNode(this)) {
				super.acceptTraverser(traverser);
				traverser.applyRenderable(_renderable);
			}
		}

	}
}