#include <bits/stdc++.h>
#define maxN 1000005
#define int long long
#define FastIO ios :: sync_with_stdio(0); cin.tie(0); cout.tie(0);
using namespace std;
int n, h[maxN], sb[maxN];
struct Stack{
    int a[maxN];
    int top;
    void init(){top = 0;}
    void push(int k){a[++top] = k;}
    void pop(){top--;}
    int topv(){return a[top];}
    int size(){return top;}
};
void __setData__()
{
    FastIO;
    freopen("FROGS.INP", "r", stdin);
    freopen("FROGS.OUT", "w", stdout);
    cin >> n;
    for(int i = 0; i < n; i++)
        cin >> h[i];
    for(int i = 0; i < n; i++)
        cin >> sb[i];
}
void __solution__()
{
    Stack st;
    vector<int> ans;
    st.init();
    st.push(1e9);
    for(int i = n - 1; i >= 0; i--)
    {
        while(st.topv() <= h[i])
            st.pop();
        if(st.size() < sb[i])
            ans.push_back(-1);
        else
        {
            int it = st.size() - sb[i] + 1;
            ans.push_back((it == 1) ? -1 : st.a[it]);
        }
        st.push(h[i]);
    }
    for(int i = n - 1; i >= 0; i--)
        cout << ans[i] << ' ';
}
int32_t main()
{
    __setData__();
    __solution__();
}