package malc0de;
use Moose;



has 'ip' => (

	is => 'rw',
 	isa => 'Str',
	#required => 1,
);


has 'classification' =>(

	is=> 'rw',
	isa =>'Str',
#	required=> 1,	

);


has 'severity' =>(

	is =>'rw',
	isa =>'Str',
#	required=> 1,
	default => 'sample',
	


);
has 'Source' =>(
	is=>'rw',
	isa=>'Int',
	default =>'4',

);
has 'flag' =>(
	is=>'rw',
	isa=>'Int',
	default =>1,

);
no Moose;
1;

