local armleft = piece('armleft');
local armright = piece('armright');
local Empty = piece('Empty');
local footleft = piece('footleft');
local footright = piece('footright');
local forearmleft = piece('forearmleft');
local forearmright = piece('forearmright');
local handleft = piece('handleft');
local handright = piece('handright');
local head = piece('head');
local kneeleft = piece('kneeleft');
local kneeright = piece('kneeright');
local pelvis = piece('pelvis');
local staff = piece('staff');
local thighleft = piece('thighleft');
local thighright = piece('thighright');
local torso = piece('torso');

local x_axis = 1
local y_axis = 2
local z_axis = 3

return {
	{
		['time'] = 0,
		['commands'] = {
			{['c']='turn',['p']=armleft, ['a']=x_axis, ['t']=0.964180, ['s']=28.925213},
			{['c']='turn',['p']=armleft, ['a']=y_axis, ['t']=1.420108, ['s']=42.603040},
			{['c']='turn',['p']=armleft, ['a']=z_axis, ['t']=0.102879, ['s']=3.086165},
			{['c']='turn',['p']=Empty, ['a']=x_axis, ['t']=0.000007, ['s']=0.000000},
			{['c']='turn',['p']=Empty, ['a']=y_axis, ['t']=0.000007, ['s']=0.000002},
			{['c']='turn',['p']=Empty, ['a']=z_axis, ['t']=0.000007, ['s']=0.000000},
			{['c']='turn',['p']=footleft, ['a']=x_axis, ['t']=0.000007, ['s']=0.000000},
			{['c']='turn',['p']=footleft, ['a']=y_axis, ['t']=0.000007, ['s']=0.000000},
			{['c']='turn',['p']=footleft, ['a']=z_axis, ['t']=0.000007, ['s']=0.000000},
			{['c']='turn',['p']=staff, ['a']=x_axis, ['t']=-0.113217, ['s']=3.396711},
			{['c']='turn',['p']=staff, ['a']=y_axis, ['t']=0.468308, ['s']=14.049032},
			{['c']='turn',['p']=staff, ['a']=z_axis, ['t']=-0.024348, ['s']=0.730651},
			{['c']='turn',['p']=footright, ['a']=x_axis, ['t']=0.000007, ['s']=0.000000},
			{['c']='turn',['p']=footright, ['a']=y_axis, ['t']=0.000007, ['s']=0.000000},
			{['c']='turn',['p']=footright, ['a']=z_axis, ['t']=0.000007, ['s']=0.000000},
			{['c']='turn',['p']=pelvis, ['a']=x_axis, ['t']=0.000007, ['s']=0.000000},
			{['c']='turn',['p']=pelvis, ['a']=y_axis, ['t']=0.000007, ['s']=0.000000},
			{['c']='turn',['p']=pelvis, ['a']=z_axis, ['t']=0.000007, ['s']=0.000000},
			{['c']='turn',['p']=armright, ['a']=x_axis, ['t']=1.575174, ['s']=47.255017},
			{['c']='turn',['p']=armright, ['a']=y_axis, ['t']=-1.233664, ['s']=37.010124},
			{['c']='turn',['p']=armright, ['a']=z_axis, ['t']=-0.006327, ['s']=0.190012},
			{['c']='turn',['p']=forearmright, ['a']=x_axis, ['t']=-0.102408, ['s']=3.072439},
			{['c']='turn',['p']=forearmright, ['a']=y_axis, ['t']=0.420460, ['s']=12.613593},
			{['c']='turn',['p']=forearmright, ['a']=z_axis, ['t']=-0.019460, ['s']=0.583986},
			{['c']='turn',['p']=torso, ['a']=x_axis, ['t']=0.000007, ['s']=0.000000},
			{['c']='turn',['p']=torso, ['a']=y_axis, ['t']=0.000007, ['s']=0.000000},
			{['c']='turn',['p']=torso, ['a']=z_axis, ['t']=0.000007, ['s']=0.000000},
			{['c']='turn',['p']=handright, ['a']=x_axis, ['t']=-0.082696, ['s']=2.481082},
			{['c']='turn',['p']=handright, ['a']=y_axis, ['t']=0.335848, ['s']=10.075252},
			{['c']='turn',['p']=handright, ['a']=z_axis, ['t']=-0.012111, ['s']=0.363528},
			{['c']='turn',['p']=kneeright, ['a']=x_axis, ['t']=0.000007, ['s']=0.000000},
			{['c']='turn',['p']=kneeright, ['a']=y_axis, ['t']=0.000007, ['s']=0.000000},
			{['c']='turn',['p']=kneeright, ['a']=z_axis, ['t']=0.000007, ['s']=0.000000},
			{['c']='turn',['p']=handleft, ['a']=x_axis, ['t']=0.846106, ['s']=25.382990},
			{['c']='turn',['p']=handleft, ['a']=y_axis, ['t']=-0.466820, ['s']=14.004805},
			{['c']='turn',['p']=handleft, ['a']=z_axis, ['t']=-0.158283, ['s']=4.748704},
			{['c']='turn',['p']=kneeleft, ['a']=x_axis, ['t']=0.000007, ['s']=0.000000},
			{['c']='turn',['p']=kneeleft, ['a']=y_axis, ['t']=0.000007, ['s']=0.000000},
			{['c']='turn',['p']=kneeleft, ['a']=z_axis, ['t']=0.000007, ['s']=0.000000},
			{['c']='turn',['p']=head, ['a']=x_axis, ['t']=0.000007, ['s']=0.000000},
			{['c']='turn',['p']=head, ['a']=y_axis, ['t']=0.000007, ['s']=0.000000},
			{['c']='turn',['p']=head, ['a']=z_axis, ['t']=0.000007, ['s']=0.000000},
			{['c']='turn',['p']=thighleft, ['a']=x_axis, ['t']=0.023992, ['s']=0.719572},
			{['c']='turn',['p']=thighleft, ['a']=y_axis, ['t']=-0.138586, ['s']=4.157765},
			{['c']='turn',['p']=thighleft, ['a']=z_axis, ['t']=0.006240, ['s']=0.187006},
			{['c']='turn',['p']=forearmleft, ['a']=x_axis, ['t']=-0.039526, ['s']=1.185975},
			{['c']='turn',['p']=forearmleft, ['a']=y_axis, ['t']=-0.128773, ['s']=3.863392},
			{['c']='turn',['p']=forearmleft, ['a']=z_axis, ['t']=-0.155931, ['s']=4.678120},
			{['c']='turn',['p']=thighright, ['a']=x_axis, ['t']=0.000007, ['s']=0.000000},
			{['c']='turn',['p']=thighright, ['a']=y_axis, ['t']=0.000007, ['s']=0.000000},
			{['c']='turn',['p']=thighright, ['a']=z_axis, ['t']=0.000007, ['s']=0.000000},
		}
	},
	{
		['time'] = 1,
		['commands'] = {
			{['c']='turn',['p']=thighright, ['a']=z_axis, ['t']=0.000007, ['s']=0.000000},
		}
	},
}
