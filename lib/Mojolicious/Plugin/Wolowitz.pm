package Mojolicious::Plugin::Wolowitz;
BEGIN {
  $Mojolicious::Plugin::Wolowitz::VERSION = '1.0.0';
}
# ABSTRACT: Mojo I18n with Locale::Wolowitz

use Mojo::Base 'Mojolicious::Plugin';
use Locale::Wolowitz;

sub register {
    my ($self, $app, $config) = @_;

    my $w = Locale::Wolowitz->new( $app->home->rel_dir("i18n") );
    $app->helper(
        loc => sub {
            my ($app, $message, @args) = @_;
            $w->loc($message, $app->stash('language') || 'en' , @args);
        }
    );
}

1;


__END__
=pod

=head1 NAME

Mojolicious::Plugin::Wolowitz - Mojo I18n with Locale::Wolowitz

=head1 VERSION

version 1.0.0

=head1 METHODS

=head2 loc($message, @args)

Return the localized C<$message>. The target language is retrieved from app stash.

For example:

    # In controller
    $self->stash("zh-TW");

    # In view
    <%= loc("Nihao") %>

=head1 AUTHOR

Kang-min Liu <gugod@gugod.org>

=head1 COPYRIGHT AND LICENSE

This software is Copyright (c) 2011 by Kang-min Liu.

This is free software, licensed under:

  The MIT (X11) License

=cut

