//-----------------------------------------------------------------
// 指定の点が、ポリゴン（２次元多角形）内に存在しているかチェック
// POINT target   --- チェック対象のポイント
// POINT *poly    --- 選択領域のポリゴン
// int max        --- ポリゴンの数
//
// 戻り：1:内在する
//-----------------------------------------------------------------
int HasPoint2D(POINT target, POINT *poly, int max)
{
int cc,dd, r=0;

    for(cc=0,dd=max-1; cc<max;dd=cc++){
        if( ( ((poly[cc].y<=target.y) && (target.y<poly[dd].y))
           || ((poly[dd].y<=target.y) && (target.y<poly[cc].y)) )
         && (target.x<(poly[dd].x-poly[cc].x)*(target.y-poly[cc].y)
            / (poly[dd].y-poly[cc].y)+poly[cc].x) ){
            r=!r;
        }
    }
    return r;
}
