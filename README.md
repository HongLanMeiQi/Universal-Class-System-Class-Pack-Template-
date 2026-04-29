# Class Pack Creation Guide

To create a class pack for Universal Class System for other players to use, you need to download this template file and create following its settings. You may need to create prefab variants, otherwise the errors caused by modifying the template can be quite troublesome.  

1. First, after downloading the template, create a new Unity project and import the Ravenfield Tools Pack into the project, then drag the template folder into Unity's folder window;  
2. Select a prefab named "CLASS_PACK" and create prefab variants based on this template;  
3. Prepare several Class icon sprites in advance, preferably with pure white patterns and transparent backgrounds;
4. Edit the strings under Class_Name id in the Data Container component of all child objects in the prefab variant, set them to the desired Class names, and place the corresponding Class icon sprites into the Value with id "Class_Icon", repeat this process for other child objects;
5. To make the class pack truly functional, you also need to edit the Mutator file, create a prefab, add a Mutator Content Mod component, copy or directly duplicate the Mutator component from the default class pack and paste it into the new Mutator, then modify or add corresponding Class configuration options, including weapon name strings, Class weight sliders, and Label content. Pay attention to the priority settings of these configuration options, as you don't want the configuration interface to look cluttered. **Also note that the naming of weapon configuration option ids must follow the format of "Your class name" + Slot + Weapon otherwise the script cannot read these configuration options and errors will occur.** It's best to refer to the configuration of the default class pack;
6. After completing all the above steps, you just need to select your Mutator file and export the RFC file using Ctrl+E, and you have successfully created your first class pack.

## 中文版
# 兵种包创建教程
要为Universal Class System创作兵种包供其他玩家游玩，你需要下载此模板文件，参照模板的设置进行创建。
你可能需要创建预制件变体，不然修改模板主体造成的错误是相当麻烦的
1. 首先，下载模板后，新建unity项目并将Ravenfield  Tools  Pack导入项目，再将模板文件夹拖入unity的文件夹窗口；
2. 选择一个名称为CLASS_PACK的预制件，以此为模板创建预制件变体；
3. 提前准备好几张Class图标精灵，尽量是纯白色图案和透明背景；
4. 编辑预制件变体内所有子物体中的Data Container组件内的Class_Name id下的字符串，将其设置为你需要的Class的名称，在将对应的Class图标精灵放入id为Class_Icon的Value内，其他子物体亦如此操作；
5. 要想兵种包真正可用，你还需要编辑Mutator文件，创建一个预制件，添加一个Mutator Content Mod组件，仿照或直接复制默认兵种包的Mutator组件并粘贴到新的Mutator里，然后修改或添加对应Class的配置选项，包括武器名称字符串，Class权重滑块以及Label内容，注意这些配置选项的优先级设置，毕竟你也不希望让配置界面看起来非常杂乱无章，**而且要注意，武器配置选项id的命名必须遵循"你的兵种名称" + Slot + Weapon 的格式，否则脚本无法读取这些配置选项而导致出错**，最好参考默认兵种包的配置；
6. 完成以上所有步骤之后，你只需要选中你的Mutator文件然后Ctrl+E导出RFC文件，那样你就成功创建了你的第一个兵种包了。
