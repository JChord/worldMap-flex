package valueObjects {
    [Bindable]
    public class AreaData {
        public var id:String;
        public var city:String;
        public var alias:String;
        public var score:Number;
        public var content:String;
        public var url:String;

        public function AreaData( id:String, city:String, alias:String, score:Number, content:String, url:String ) {
            this.id = id;
            this.city = city;
            this.alias = alias;
            this.score = score;
            this.content = content;
            this.url = url;
        }

        public static function buildAreaFromAttributes ( data:XML ) : AreaData {
            var areaData:AreaData = new AreaData(
                    data.@id,
                    data.city,
                    data.alias,
                    data.score,
                    data.content,
                    data.url
            );
            return areaData;
        }

        public static function buildAreaFromJSON ( json:Object ) : AreaData  {
            var areaData:AreaData = new AreaData(
                    json['id'],
                    json['city'],
                    json['alias'],
                    json['score'],
                    json['content'],
                    json['url']
            );
            return areaData;
        }

        public function toString():String {
            return "city:" + this.city + "\n"
                   +"alias:" + this.alias + "\n"
                   +"score:" + this.score + "\n"
                   +"content:" + this.content + "\n"
                   +"url:" + this.url;
        }
    }
}