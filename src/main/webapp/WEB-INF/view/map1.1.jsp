
<%@ page contentType="text/html;charset=UTF-8"%>

<style>
    area {
        display: block;
        background-color:pink;
    }
    area:hover {
        border: 2px solid indianred;
    }
</style>

<div class="container">
    <div class="map" style="display: block;background-image: url('img/store-layout.png');
background-size: contain;position: relative;padding: 0px;width: 960px;height: 593px;">
        <canvas style="width: 960px; height: 592.991px; position: absolute; left: 0px; top: 0px;
padding: 0px; border: 0px; opacity: 1;" height="593" width="960">
        </canvas>
    <img class="map maphilighted" alt="store-layout" src="img/store-layout.png" usemap="#mappy" style="opacity: 1e-10;
position: absolute; left: 0px; top: 0px; padding: 0px; border: 0px;">
    <map name="mappy" class="mappy">
        <area target="" alt="29" title="29" href="" coords="186,163,141,66" shape="rect">
        <area target="" alt="30" title="30" href="" coords="188,67,234,163" shape="rect">
        <area target="" alt="31" title="31" href="" coords="238,66,273,160,273,66" shape="rect">
        <area target="" alt="32" title="32" href="" coords="273,66,311,158" shape="rect">
        <area target="" alt="33" title="33" href="" coords="312,66,346,158,348,68" shape="rect">
        <area target="" alt="34" title="34" href="" coords="346,66,382,157" shape="rect">
        <area target="" alt="35" title="35" href="" coords="384,66,411,158" shape="rect">
        <area target="" alt="36" title="36" href="" coords="412,65,434,158" shape="rect">
        <area target="" alt="37" title="37" href="" coords="435,65,458,158" shape="rect">
        <area target="" alt="38" title="38" href="" coords="458,65,481,158" shape="rect">
        <area target="" alt="39" title="39" href="" coords="482,67,506,158" shape="rect">
        <area target="" alt="40" title="40" href="" coords="506,66,531,158" shape="rect">
        <area target="" alt="41" title="41" href="" coords="533,66,560,158" shape="rect">
        <area target="" alt="42" title="42" href="" coords="561,66,586,158" shape="rect">
        <area target="" alt="43" title="43" href="" coords="587,66,615,158" shape="rect">
        <area target="" alt="44" title="44" href="" coords="613,66,637,158" shape="rect">
        <area target="" alt="45" title="45" href="" coords="637,65,662,158" shape="rect">
        <area target="" alt="46" title="46" href="" coords="663,66,688,158" shape="rect">
        <area target="" alt="47" title="47" href="" coords="688,66,713,158" shape="rect">
        <area target="" alt="48" title="48" href="" coords="716,66,740,159" shape="rect">
        <area target="" alt="49" title="49" href="" coords="741,66,763,158" shape="rect">
        <area target="" alt="1A" title="1A" href="" coords="765,65,784,160" shape="rect">
        <area target="" alt="1B" title="1B" href="" coords="786,64,809,157" shape="rect">
        <area target="" alt="1C" title="1C" href="" coords="809,63,833,157" shape="rect">
        <area target="" alt="1D" title="1D" href="" coords="835,63,856,155" shape="rect">
        <area target="" alt="1E" title="1E" href="" coords="858,64,881,156" shape="rect">
        <area target="" alt="51" title="51" href="" coords="828,159,937,184" shape="rect">
        <area target="" alt="52" title="52" href="" coords="829,184,936,210" shape="rect">
        <area target="" alt="53" title="53" href="" coords="828,210,951,234" shape="rect">
        <area target="" alt="54" title="54" href="" coords="828,236,935,263" shape="rect">
        <area target="" alt="55" title="55" href="" coords="829,263,936,293" shape="rect">
        <area target="" alt="56" title="56" href="" coords="847,291,935,319" shape="rect">
        <area target="" alt="57" title="57" href="" coords="935,345,831,319" shape="rect">
        <area target="" alt="58" title="58" href="" coords="830,348,950,374" shape="rect">
        <area target="" alt="59" title="59" href="" coords="830,375,934,399" shape="rect">
        <area target="" alt="60" title="60" href="" coords="934,430,859,403" shape="rect">
        <area target="" alt="61" title="61" href="" coords="860,430,935,457" shape="rect">
        <area target="" alt="62" title="62" href="" coords="935,483,830,458" shape="rect">
        <area target="" alt="63" title="63" href="" coords="935,514,823,486" shape="rect">
        <area target="" alt="1" title="1" href="" coords="680,361,693,480" shape="rect">
        <area target="" alt="2" title="2" href="" coords="658,359,678,450" shape="rect">
        <area target="" alt="HD" title="HD" href="" coords="671,486,648,451,758,542" shape="rect">
        <area target="" alt="3" title="3" href="" coords="635,360,658,452" shape="rect">
        <area target="" alt="4" title="4" href="" coords="615,360,635,480" shape="rect">
        <area target="" alt="5" title="5" href="" coords="593,361,614,482" shape="rect">
        <area target="" alt="6" title="6" href="" coords="571,360,591,450" shape="rect">
        <area target="" alt="7" title="7" href="" coords="549,360,571,480" shape="rect">
        <area target="" alt="8" title="8" href="" coords="527,359,548,479" shape="rect">
        <area target="" alt="9" title="9" href="" coords="508,361,526,479" shape="rect">
        <area target="" alt="10" title="10" href="" coords="486,359,507,480" shape="rect">
        <area target="" alt="11" title="11" href="" coords="468,360,484,480" shape="rect">
        <area target="" alt="13" title="13" href="" coords="450,360,465,481" shape="rect">
        <area target="" alt="14" title="14" href="" coords="426,360,448,480" shape="rect">
        <area target="" alt="15" title="15" href="" coords="401,360,426,481" shape="rect">
        <area target="" alt="16" title="16" href="" coords="376,358,399,481" shape="rect">
        <area target="" alt="17" title="17" href="" coords="352,359,376,481" shape="rect">
        <area target="" alt="18" title="18" href="" coords="332,360,351,481" shape="rect">
        <area target="" alt="19" title="19" href="" coords="307,360,329,480" shape="rect">
        <area target="" alt="20" title="20" href="" coords="289,360,305,481" shape="rect">
        <area target="" alt="21" title="21" href="" coords="273,363,288,473" shape="rect">
        <area target="" alt="12" title="12" href="" coords="316,497,473,516" shape="rect">
        <area target="" alt="HA" title="HA" href="" coords="793,256,671,205" shape="rect">
        <area target="" alt="3A" title="3A" href="" coords="618,201,648,330" shape="rect">
        <area target="" alt="4A" title="4A" href="" coords="588,201,618,329" shape="rect">
        <area target="" alt="5A" title="5A" href="" coords="560,202,586,330" shape="rect">
        <area target="" alt="6A" title="6A" href="" coords="532,201,561,330" shape="rect">
        <area target="" alt="7A" title="7A" href="" coords="503,201,532,330" shape="rect">
        <area target="" alt="8A" title="8A" href="" coords="468,202,503,330" shape="rect">
        <area target="" alt="22" title="22" href="" coords="298,334,441,357" shape="rect">
        <area target="" alt="23" title="23" href="" coords="298,307,441,332" shape="rect">
        <area target="" alt="24" title="24" href="" coords="298,277,442,306" shape="rect">
        <area target="" alt="25" title="25" href="" coords="298,251,442,278" shape="rect">
        <area target="" alt="26" title="26" href="" coords="298,223,442,252" shape="rect">
        <area target="" alt="27" title="27" href="" coords="298,194,398,222" shape="rect">
        <area target="" alt="28" title="28" href="" coords="297,176,398,195" shape="rect">
        <area target="" alt="28A" title="28A" href="" coords="186,176,268,197" shape="rect">
        <area target="" alt="27A" title="27A" href="" coords="187,197,268,226" shape="rect">
        <area target="" alt="26A" title="26A" href="" coords="268,256,173,227" shape="rect">
        <area target="" alt="GB" title="GB" href="" coords="61,278,273,361" shape="rect">
        <area target="" alt="OG" title="OG" href="" coords="61,361,174,574" shape="rect">
        <area target="" alt="GH" title="GH" href="" coords="175,361,273,574" shape="rect">

    </map>
</div>
</div>