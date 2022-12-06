<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
    <head>
        <title>オススメ降下地点登録</title>
        <style type="text/css">

            input[type="number"] {width:3em;
                                  text-align:right;}

            body{
                background-image: url("pas.jpeg");
            }
            th{
                background-color:rgba(255,0,0,0.8);
                padding: 10px 10px;
            }
            td{
                background-color:rgba(215, 255, 254, 0.8);
                padding: 0px 10px;
            }
        </style>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>

        <script language="JavaScript">

            function check() {
                if (window.confirm('オススメ降下地点を決定します.')) { // 確認ダイアログを表示
                    return true; // 「OK」時は送信を実行
                } else { // 「キャンセル」時の処理
                    window.alert('キャンセルしました.'); // 警告ダイアログを表示
                    return false; 
                }

            }
//-->
        </script>
    </head>
    <body>
        <form name="ticket" method="post" action="./AddRecord" onSubmit="return check()">
            <table>
                <tr>
                <table cellpadding="0" cellspacing="0" border="2" align="left" style="margin-left:100px;">
                    <tr>
                        <th>キングスキャニオン</th>
                    </tr>
                    <tr>
                        <td><input type="radio" name="KINGSCANYON" value="スラムレイク" onclick="connecttext('0', this.checked); calcSum()">・スラムレイク</td>
                    </tr>
                    <tr>
                        <td><input type="radio" name="KINGSCANYON" value="ザ・ピッド"  onclick="connecttext('1', this.checked); calcSum()">・ザ・ピッド</td>
                    </tr>
                    <tr>
                        <td><input type="radio" name="KINGSCANYON" value="ランオフ"  onclick="connecttext('2', this.checked); calcSum()">・ランオフ</td>
                    </tr>
                    <tr>
                        <td><input type="radio" name="KINGSCANYON" value="航空基地"  onclick="connecttext('3', this.checked); calcSum()">・航空基地</td>
                    </tr>
                    <tr>
                        <td><input type="radio" name="KINGSCANYON" value="ガントレット"  onclick="connecttext('4', this.checked); calcSum()">・ガントレット</td>
                    </tr>
                    <tr>
                        <td><input type="radio" name="KINGSCANYON" value="サルベージ"  onclick="connecttext('5', this.checked); calcSum()">・サルベージ</td>
                    </tr>
                    <tr>
                        <td><input type="radio" name="KINGSCANYON" value="マーケット"  onclick="connecttext('6', this.checked); calcSum()">・マーケット</td>
                    </tr>
                    <tr>
                        <td><input type="radio" name="KINGSCANYON" value="水処理施設"  onclick="connecttext('7', this.checked); calcSum()">・水処理施設</td>
                    </tr>
                    <tr>
                        <td><input type="radio" name="KINGSCANYON" value="砲台"  onclick="connecttext('8', this.checked); calcSum()">・砲台</td>
                    </tr>
                    <tr>
                        <td><input type="radio" name="KINGSCANYON" value="ザ・ケージ"  onclick="connecttext('9', this.checked); calcSum()">・ザ・ケージ</td>
                    </tr>
                    <tr>
                        <td><input type="radio" name="KINGSCANYON" value="キャパシター"  onclick="connecttext('10', this.checked); calcSum()">・キャパシター</td>
                    </tr>
                    <tr>
                        <td><input type="radio" name="KINGSCANYON" value="研究所"  onclick="connecttext('11', this.checked); calcSum()">・研究所</td>
                    </tr>
                    <tr>
                        <td><input type="radio" name="KINGSCANYON" value="ハイドロダム"  onclick="connecttext('12', this.checked); calcSum()">・ハイドロダム</td>
                    </tr>
                    <tr>
                        <td><input type="radio" name="KINGSCANYON" value="リパルサー"  onclick="connecttext('13', this.checked); calcSum()">・リパルサー</td>
                    </tr>
                    <tr>
                        <td><input type="radio" name="KINGSCANYON" value="ザ・リグ"  onclick="connecttext('14', this.checked); calcSum()">・ザ・リグ</td>
                    </tr>
                    <tr>
                        <td><input type="radio" name="KINGSCANYON" value="沼沢"  onclick="connecttext('15', this.checked); calcSum()">・沼沢</td>
                    </tr>
                </table>
                </tr>
                 <tr>
                <table cellpadding="0" cellspacing="0" border="2" align="left" style="margin-left:100px;">
                    <tr>
                        <th>ワールドエッジ</th>
                    </tr>
                    <tr>
                        <td><input type="radio" name="WORLDEDGE" value="試練" onclick="connecttext('0', this.checked); calcSum()">・試練</td>
                    </tr>
                    <tr>
                        <td><input type="radio" name="WORLDEDGE" value="スカイフック" onclick="connecttext('1', this.checked); calcSum()">・スカイフック</td>
                    </tr>
                    <tr>
                        <td><input type="radio" name="WORLDEDGE" value="調査キャンプ" onclick="connecttext('2', this.checked); calcSum()">・調査キャンプ</td>
                    </tr>
                    <tr>
                        <td><input type="radio" name="WORLDEDGE" value="製錬所" onclick="connecttext('3', this.checked); calcSum()">・製錬所</td>
                    </tr>
                    <tr>
                        <td><input type="radio" name="WORLDEDGE" value="エピセンター" onclick="connecttext('4', this.checked); calcSum()">・エピセンター</td>
                    </tr>
                    <tr>
                        <td><input type="radio" name="WORLDEDGE" value="展望" onclick="connecttext('5', this.checked); calcSum()">・展望</td>
                    </tr>
                    <tr>
                        <td><input type="radio" name="WORLDEDGE" value="フラグメントウエスト" onclick="connecttext('6', this.checked); calcSum()">・フラグメントウエスト</td>
                    </tr>
                    <tr>
                        <td><input type="radio" name="WORLDEDGE" value="フラグメントイースト" onclick="connecttext('7', this.checked); calcSum()">・フラグメントイースト</td>
                    </tr>
                    <tr>
                        <td><input type="radio" name="WORLDEDGE" value="カウントダウン" onclick="connecttext('8', this.checked); calcSum()">・カウントダウン</td>
                    </tr>
                    <tr>
                        <td><input type="radio" name="WORLDEDGE" value="溶岩溝" onclick="connecttext('9', this.checked); calcSum()">・溶岩溝</td>
                    </tr>
                    <tr>
                        <td><input type="radio" name="WORLDEDGE" value="列車庫" onclick="connecttext('10', this.checked); calcSum()">・列車庫</td>
                    </tr>
                    <tr>
                        <td><input type="radio" name="WORLDEDGE" value="ハーベスター" onclick="connecttext('11', this.checked); calcSum()">・ハーベスター</td>
                    </tr>
                    <tr>
                        <td><input type="radio" name="WORLDEDGE" value="間欠泉" onclick="connecttext('12', this.checked); calcSum()">・間欠泉</td>
                    </tr>
                    <tr>
                        <td><input type="radio" name="WORLDEDGE" value="火力発電所" onclick="connecttext('13', this.checked); calcSum()">・火力発電所</td>
                    </tr>
                    <tr>
                        <td><input type="radio" name="WORLDEDGE" value="仕分け工場" onclick="connecttext('14', this.checked); calcSum()">・仕分け工場</td>
                    </tr>
                    <tr>
                        <td><input type="radio" name="WORLDEDGE" value="ザ・ツリー" onclick="connecttext('15', this.checked); calcSum()">・ザ・ツリー</td>
                    </tr>
                    <tr>
                        <td><input type="radio" name="WORLDEDGE" value="発射場" onclick="connecttext('16', this.checked); calcSum()">・発射場</td>
                    </tr>
                    <tr>
                        <td><input type="radio" name="WORLDEDGE" value="ザ・ドーム" onclick="connecttext('17', this.checked); calcSum()">・ザ・ドーム</td>
                    </tr>
                    <tr>
                        <td><input type="radio" name="WORLDEDGE" value="ラバシティー" onclick="connecttext('18', this.checked); calcSum()">・ラバシティー</td>
                    </tr>
                    </table>
                     <table cellpadding="0" cellspacing="0" border="2" align="left" style="margin-left:100px;">
                    <tr>
                        <th>オリンパス</th>
                    </tr>
                     <tr>
                        <td><input type="radio" name="OLYMPUS" value="ドック" onclick="connecttext('0', this.checked); calcSum()">・ドック</td>
                    </tr>
                    <tr>
                        <td><input type="radio" name="OLYMPUS" value="母艦" onclick="connecttext('0', this.checked); calcSum()">・母艦</td>
                    </tr>
                    <tr>
                        <td><input type="radio" name="OLYMPUS" value="送電網" onclick="connecttext('0', this.checked); calcSum()">・送電網</td>
                    </tr>
                    <tr>
                        <td><input type="radio" name="OLYMPUS" value="リフト" onclick="connecttext('0', this.checked); calcSum()">・リフト</td>
                    </tr>
                    <tr>
                        <td><input type="radio" name="OLYMPUS" value="ガーデン" onclick="connecttext('0', this.checked); calcSum()">・ガーデン</td>
                    </tr>
                    <tr>
                        <td><input type="radio" name="OLYMPUS" value="エネルギー貯蔵庫" onclick="connecttext('0', this.checked); calcSum()">・エネルギー貯蔵庫</td>
                    </tr>
                    <tr>
                        <td><input type="radio" name="OLYMPUS" value="タービン" onclick="connecttext('0', this.checked); calcSum()">・タービン</td>
                    </tr>
                    <tr>
                        <td><input type="radio" name="OLYMPUS" value="オアシス" onclick="connecttext('0', this.checked); calcSum()">・オアシス</td>
                    </tr>
                    <tr>
                        <td><input type="radio" name="OLYMPUS" value="エステート" onclick="connecttext('0', this.checked); calcSum()">・エステート</td>
                    </tr>
                    <tr>
                        <td><input type="radio" name="OLYMPUS" value="ハモンド研究所" onclick="connecttext('0', this.checked); calcSum()">・ハモンド研究所</td>
                    </tr>
                    <tr>
                        <td><input type="radio" name="OLYMPUS" value="グロータワー" onclick="connecttext('0', this.checked); calcSum()">・グロータワー</td>
                    </tr>
                    <tr>
                        <td><input type="radio" name="OLYMPUS" value="エリジウム" onclick="connecttext('0', this.checked); calcSum()">・エリジウム</td>
                    </tr>
                    <tr>
                        <td><input type="radio" name="OLYMPUS" value="水耕施設" onclick="connecttext('0', this.checked); calcSum()">・水耕施設</td>
                    </tr>
                    <tr>
                        <td><input type="radio" name="OLYMPUS" value="ソーラーアレイ" onclick="connecttext('0', this.checked); calcSum()">・ソーラーアレイ</td>
                    </tr>
                    <tr>
                        <td><input type="radio" name="OLYMPUS" value="軌道砲" onclick="connecttext('0', this.checked); calcSum()">・軌道砲</td>
                    </tr>
                    <tr>
                        <td><input type="radio" name="OLYMPUS" value="盆栽プラザ" onclick="connecttext('0', this.checked); calcSum()">・盆栽プラザ</td>
                    </tr>   
                 </table>
                 <td colspan="2" align="right"><input type="submit" value="オススメ降下地点決定"></td>
                 </tr>
            </table>
        </form>    
    </body>
</html>
