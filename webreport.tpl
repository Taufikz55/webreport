<html>
<head>
    <title>Web Report Lake Outdoor</title>
    <script type="text/javascript">
        function settop(x) {
            document.getElementById('top_line').value = x;
        }
    </script>
    <style> body { background-color: #C6E2FF; color: #3a5fcd }
 h2 { color: #c6e2ff; background-color: #3a5fcd }
 .caption-left { float: left; width:20% }
.caption-middle { padding-left: 212px }
.center { text-align: center }
.data { font-size: 8pt; background-color: #f6fafd }
 </style>
</head>
<body>
    <!-- style="color: white; background-color: black"> -->
    <!-- <div style="colour: black; background-color: orange"></div> -->
    <h2><a href="/">Web Report Lake Outdoor</a></h2>
    <form action="/" method='get'>
    <div>
        <span style="float: left; width:20%">Pilih File Log:</span>
        <span>
            <select name="logfile" id="logfile" onchange="submit()">
            % for dir in loglist:
                <option
                %if dir == logfile:
                    selected="selected"
                %end
                >{{ dir }}</option>
            %end
            </select>
        </span>
        <span>
            <input type="submit" value="reload" />
            <a href="/top" title="Halaman Pertama"><input type="button" value=Awal" /></a>
            <a href="/prev" title="Halaman Sebelumnya"><input type="button" value="Sebelumnya" /></a>
            <a href="/next" title="Halaman Selanjutnya"><input type="button" value="Selanjutnya" /></a>
            <a href="/bottom" title="Halaman Terakhir"><input type="button" value="Terakhir" /></a>
        </span>
    </div>
    <div>
        <span style="float: left; width:20%">Jumlah Entri Halaman:</span>
        <span>
            <select name="entries" id="entries" onchange="submit()">
            %for num in numentries:
                <option
                %if num == entries:
                    selected="selected"
                %end
                >{{ num }}</option>
            %end
            </select>
        </span>
        <span style="padding-left: 212px">Urutan ke:</span>
        <span>
            <input type="radio" name="order" value="desc" onclick="settop('refresh');submit()"
            %if order == "desc":
                checked="checked"
            %end
            />&nbsp;nieuwste eerst&nbsp;
            <input type="radio" name="order" value="asc" onclick="settop('refresh');submit()"
            %if order == "asc":
                checked="checked"
            %end
            />&nbsp;nieuwste laatst&nbsp;
        </span>
    </div>
    <div style="text-align: center">{{mld}}&nbsp;</div>
    <div>
        <table>
            <tr>
                <th>When</th><th>What</th><th>Where</th>
            </tr>
            %for data in logdata:
            <tr>
                %if errorlog:
                <td>
                <textarea style="font-size: 8pt" rows="2" cols="25">{{data['date']}}</textarea>
                </td>
                <td>
                <textarea style="font-size: 8pt" rows="2" cols="70">{{data['data']}}</textarea>
                </td>
                <td>
                <textarea style="font-size: 8pt" rows="2" cols="35">{{data['client']}}</textarea>
                </td>
                %else:
                <td>
                <textarea style ="font-size: 8pt" rows="2" cols="25">{{data['date']}}</textarea>
                </td>
                <td>
                <textarea style="font-size: 8pt" rows="2" cols="60">{{data['data']}}</textarea>
                </td>
                <td>
                <textarea style="font-size: 8pt" rows="2" cols="25">{{data['client']}}</textarea>
                </td>
                % end
            </tr>
            %end
        </table>
    </div>
    </form>
</body>
</html>
