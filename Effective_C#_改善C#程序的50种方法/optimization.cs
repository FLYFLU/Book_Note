// search diff
private List<string> GetList1Diff(IList<string> lst1,IList<string> lst2)
{
    for(int i=0;i<lst2.Count;i++)
    {
        //cause source object change 
        // lst1 changed after this
        lst1.Remove(lst2(i);
    }
    return lst1;
}
