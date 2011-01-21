package HTML::Shakan::Field::Choice;
use Any::Moose;
extends 'HTML::Shakan::Field';

has '+widget' => (
    default => 'select'
);

has choices => (
    is       => 'rw',
    isa      => 'ArrayRef',
    required => 1,
);

override 'get_constraints' => sub {
    my $self = shift;
    my ($name, $constraints) = super();

    return (
        $name => [
            @$constraints,
            ['CHOICE' => $self->choices]
        ]
    );
};

no Any::Moose;
__PACKAGE__->meta->make_immutable;
__END__

=head1 NAME

HTML::Shakan::Field::Choice - choice field

=head1 SYNOPSIS

    use HTML::Shakan::Field::Choice;
    HTML::Shakan::Field::Choice->new(
        name => 'pref',
        choices => [qw/tokyo osaka kyoto/],
    );

    # or shortcut
    use HTML::Shakan::Fields;
    ChoiceField(
        name => 'pref',
        choices => [qw/tokyo osaka kyoto/],
    );

    # if you want radio button
    ChoiceField(
        name => 'pref',
        choices => [qw/tokyo osaka kyoto/],
        widget => 'radio',
    );

=head1 DESCRIPTION

Choice field implementation. This field may show in html as C<< <select></select> >> tag.

=head1 base class

HTML::Shakan::Field

=head1 SEE ALSO

L<HTML::Shakan>
