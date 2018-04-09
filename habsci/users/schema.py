import graphene
from graphene_django.types import DjangoObjectType
from habsci.users.models import User

class UserType(DjangoObjectType):
    class Meta:
        model = User


class UserQuery():
    user = graphene.Field(UserType,
                              id=graphene.Int(),
                              name=graphene.String())
    all_users = graphene.List(UserType)

    def resolve_user(self, info, **kwargs):
        id = kwargs.get('id')
        name = kwargs.get('name')

        if id is not None:
            return User.objects.get(id=id)

        if name is not None:
            return User.objects.get(name=name)

        return None

    def resolve_all_users(self, info, **kwargs):
        return User.objects.all()