import graphene
from graphene_django.types import DjangoObjectType
from habsci.services.models import Service

class ServiceType(DjangoObjectType):
    class Meta:
        model = Service


class ServiceQuery():
    service = graphene.Field(ServiceType,
                              id=graphene.Int(),
                              name=graphene.String())
    all_services = graphene.List(ServiceType)

    def resolve_service(self, info, **kwargs):
        id = kwargs.get('id')
        name = kwargs.get('name')

        if id is not None:
            return ServiceType.objects.get(id=id)

        if name is not None:
            return ServiceType.objects.get(name=name)

        return None

    def resolve_all_services(self, info, **kwargs):
        return Service.objects.all()