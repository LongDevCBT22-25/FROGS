uses crt;
const maxN = 1000005;
      fi = 'FROGS.INP';
      fo = 'FROGS.OUT';
type Stack = object 
    private
        top: int64;
    public 
        a: array[1..maxN] of int64;
        procedure init;
        procedure push(k:int64);
        procedure pop;
        function topf: int64;
        function size: int64;
end;
var f1, f2 : text;
    n : int64;
    h, sb : array[1..maxN] of int64;
    st : Stack;
procedure Stack.init;
    begin
        top := 0;
    end;
procedure Stack.push(k:int64);
    begin
        inc(top);
        a[top] := k;
    end;
procedure Stack.pop();
    begin
        dec(top);
    end;
function Stack.topf: int64;
    begin
        exit(a[top]);
    end;    
function Stack.size: int64;
    begin
        exit(top);
    end;    
procedure __setData__;
    var i : int64;
    begin
        assign(f1, fi); reset(f1);
        assign(f2, fo); rewrite(f2);
        readln(f1, n);
        for i := 1 to n do 
            read(f1, h[i]);
        for i := 1 to n do 
            read(f1, sb[i]);
    end;
procedure __solution__;
    var i, pre_i, it : int64;
        ans : array[1..maxN] of int64;
    begin
        pre_i := 0;
        st.init;
        st.push(20000000);
        for i := n downto 1 do 
            begin
                while st.topf() <= h[i] do
                    st.pop();
                if st.size() < sb[i] then 
                    begin
                        inc(pre_i);
                        ans[pre_i] := -1;
                    end
                else  
                    begin
                        it := st.size() - sb[i] + 1;
                        if it = 1 then 
                            begin 
                                inc(pre_i);
                                ans[pre_i] := -1;
                            end
                        else 
                            begin
                                inc(pre_i);
                                ans[pre_i] := st.a[it];
                            end;
                    end;
                st.push(h[i]);
            end;
        for i := n downto 1 do 
            write(f2, ans[i], ' ');
    end;
begin 
    __setData__;
    __solution__;
    close(f1); close(f2);
end.