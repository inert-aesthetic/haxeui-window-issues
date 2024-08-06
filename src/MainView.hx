package ;

import haxe.ui.containers.windows.Window;
import haxe.ui.containers.windows.WindowManager;
import haxe.ui.containers.VBox;
import haxe.ui.containers.TreeView;
import haxe.ui.containers.TreeViewNode;

@:build(haxe.ui.ComponentBuilder.build("assets/main-view.xml"))
class MainView extends VBox {
    public function new() {
        super();

        var root1 = tv1.addNode({ text: "root A", icon: "haxeui-core/styles/default/haxeui_tiny.png", ref: 1 });
        root1.expanded = true;
            var child = root1.addNode({ text: "child A-1", icon: "haxeui-core/styles/default/haxeui_tiny.png", ref: 2 });
                var node = child.addNode({ text: "child A-1-1", icon: "haxeui-core/styles/default/haxeui_tiny.png", ref: 3 });
                var node = child.addNode({ text: "child A-1-2", icon: "haxeui-core/styles/default/haxeui_tiny.png", ref: 4 });
                var node = child.addNode({ text: "child A-1-3", icon: "haxeui-core/styles/default/haxeui_tiny.png", ref: 5 });
                    var child = root1.addNode({ text: "child A-2", icon: "haxeui-core/styles/default/haxeui_tiny.png", ref: 6 });
                        var node = child.addNode({ text: "child A-2-1", icon: "haxeui-core/styles/default/haxeui_tiny.png", ref: 7 });
                        var node = child.addNode({ text: "child A-2-2", icon: "haxeui-core/styles/default/haxeui_tiny.png", ref: 8 });
                    var child = root1.addNode({ text: "child A-3", icon: "haxeui-core/styles/default/haxeui_tiny.png", ref: 9 });
                        var node = child.addNode({ text: "child A-3-1", icon: "haxeui-core/styles/default/haxeui_tiny.png", ref: 10 });
                        var node = child.addNode({ text: "child A-3-2", icon: "haxeui-core/styles/default/haxeui_tiny.png", ref: 11 });
                        var node = child.addNode({ text: "child A-3-3", icon: "haxeui-core/styles/default/haxeui_tiny.png", ref: 12 });
                        var node = child.addNode({ text: "child A-3-4", icon: "haxeui-core/styles/default/haxeui_tiny.png", ref: 13 });
                    var child = root1.addNode({ text: "child A-4", icon: "haxeui-core/styles/default/haxeui_tiny.png", ref: 14 });
                    var child = root1.addNode({ text: "child A-5", icon: "haxeui-core/styles/default/haxeui_tiny.png", ref: 15 });

        findNodeButton.onClick = (_) -> {
            var node = findNode(tv1, 8, "ref");
            if (node != null) {
                trace(node.text);
            } else {
                trace("not found");
            }    

           WindowManager.instance.addWindow(new TestWindow());
        }
        var nc = root1.addNode(null);
        nc.data =  {text: "child A-5", icon: "haxeui-core/styles/default/haxeui_tiny.png", ref: 23 };

    }

    private function findNode(tv:TreeView, data:Any, field:String = "text"):TreeViewNode  {
        var result = null;
        for (node in tv.getNodes()) {
            result = _findNode(node, data, field);
            if (result != null) {
                break;
            }
        }
        return result;

    }

    private function _findNode(node:TreeViewNode, data:Any, field:String):TreeViewNode {
        if (Reflect.hasField(node.data, field)) {
            var temp = Reflect.field(node.data, field);
            if (temp == data) {
                return node;
            }
        }
        var result = null;
        for (child in node.getNodes()) {
            result = _findNode(child, data, field);
            if (result != null) {
                break;
            }
        }
        return result;
    }
}

@:xml('
<?xml version="1.0" encoding="utf-8" ?>
<window>

                <property-grid id="pg1" width="250" height="300">
                    <property-group text="Primary Group">
                        <property id="actionProp" label="Action Property" type="action" value="Button"/>
                        <property id="stringProp" label="String Property" value="Value 1" />
                        <property id="boolProp" label="Bool Property" type="boolean" value="true" />
                        <property id="intProp" label="Int Property" type="int" value="101" />
                        <property id="listProp" label="List Property" type="list" value="Item 1">
                            <data>
                                <item text="Item 1" />
                                <item text="Item 2" />
                                <item text="Item 3" />
                                <item text="Item 4" />
                                <item text="Item 5" />
                                <item text="Item 6" />
                            </data>
                        </property>    
                    </property-group>

                </property-grid>
                
</window>')
class TestWindow extends Window{
    
}