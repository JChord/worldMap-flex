package valueObjects {
	[Bindable]
	public class Area {
		public var id:String;
		public var areaName:String;
		public var pos:Pos;
		public var path:String;
		public var subArea:String;
		public var hasSubArea:Boolean;
        public var areaData:AreaData;
		
		public function Area( id:String, areaName:String, pos:Pos, path:String, subArea:String, areaData:AreaData ) {
			this.id = id;
			this.areaName = areaName;
			this.pos = pos;
			this.path = path;
			this.subArea = subArea;
			this.hasSubArea = ( this.subArea != null);
            this.areaData = areaData;
		}
		
		public static function buildAreaFromAttributes ( mapDataXML:XML, areaDatasList:XMLList ) : Area {
            var areaData:AreaData;
            for each ( var areaDataXML:XML in areaDatasList ) {
                if ( mapDataXML.@id == areaDataXML.@id ) {
                    areaData = AreaData.buildAreaFromAttributes(areaDataXML);
                    break;
                }
            }

            var pos:Pos = new Pos(mapDataXML.pos.@x, mapDataXML.pos.@y);

			var area:Area = new Area(
                mapDataXML.@id,
                mapDataXML.@areaName,
				pos,
                mapDataXML.path,
                mapDataXML.subArea,
                areaData
			);
			
			return area;
		}

        public static function buildAreaFromJSON ( mapDataXML:XML, areaDatasJSON:Object ) : Area {
            var areaData:AreaData;

            for  (var id:String in areaDatasJSON) {
                if ( mapDataXML.@id == id ) {
                    areaData = AreaData.buildAreaFromJSON(areaDatasJSON[id]);
                    break;
                }
            }

            var pos:Pos = new Pos(mapDataXML.pos.@x, mapDataXML.pos.@y);

            var area:Area = new Area(
                    mapDataXML.@id,
                    mapDataXML.@areaName,
                    pos,
                    mapDataXML.path,
                    mapDataXML.subArea,
                    areaData
            );

            return area;
        }

	}
}